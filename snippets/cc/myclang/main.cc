#include <clang-c/Index.h>

#include <iostream>

int main(int argc, char** argv) {
  CXIndex index = clang_createIndex(0, 0);  // Create index
  CXTranslationUnit unit =
      clang_parseTranslationUnit(index, argv[1], nullptr, 0, nullptr, 0,
                                 CXTranslationUnit_None);  // Parse "file.cpp"

  if (unit == nullptr) {
    std::cerr << "Unable to parse translation unit. Quitting.\n";
    return 0;
  }
  CXCursor cursor = clang_getTranslationUnitCursor(
      unit);  // Obtain a cursor at the root of the translation unit

  clang_visitChildren(
      cursor,
      [](CXCursor current_cursor, CXCursor parent, CXClientData client_data) {
        CXType cursor_type = clang_getCursorType(current_cursor);

        CXString type_kind_spelling =
            clang_getTypeKindSpelling(cursor_type.kind);
        std::cout << "TypeKind: " << clang_getCString(type_kind_spelling);
        clang_disposeString(type_kind_spelling);

        if (cursor_type.kind ==
                CXType_Pointer ||  // If cursor_type is a pointer
            cursor_type.kind ==
                CXType_LValueReference ||  // or an LValue Reference (&)
            cursor_type.kind ==
                CXType_RValueReference) {  // or an RValue Reference (&&),
          CXType pointed_to_type = clang_getPointeeType(
              cursor_type);  // retrieve the pointed-to type

          CXString pointed_to_type_spelling =
              clang_getTypeSpelling(pointed_to_type);  // Spell out the entire
          std::cout << "pointing to type: "
                    << clang_getCString(
                           pointed_to_type_spelling);  // pointed-to type
          clang_disposeString(pointed_to_type_spelling);
        } else if (cursor_type.kind == CXType_Record) {
          CXString type_spelling = clang_getTypeSpelling(cursor_type);
          std::cout << ", namely " << clang_getCString(type_spelling);
          clang_disposeString(type_spelling);
        }
        std::cout << "\n";
        return CXChildVisit_Recurse;
      },
      nullptr);

  clang_visitChildren(
      cursor,
      [](CXCursor current_cursor, CXCursor parent, CXClientData client_data) {
        CXType cursor_type = clang_getCursorType(current_cursor);
        CXString cursor_spelling = clang_getCursorSpelling(current_cursor);
        CXSourceRange cursor_range = clang_getCursorExtent(current_cursor);
        std::cout << "Cursor " << clang_getCString(cursor_spelling);

        CXFile file;
        unsigned start_line, start_column, start_offset;
        unsigned end_line, end_column, end_offset;

        clang_getExpansionLocation(clang_getRangeStart(cursor_range), &file,
                                   &start_line, &start_column, &start_offset);
        clang_getExpansionLocation(clang_getRangeEnd(cursor_range), &file,
                                   &end_line, &end_column, &end_offset);
        std::cout << " spanning lines " << start_line << " to " << end_line;
        clang_disposeString(cursor_spelling);

        std::cout << "\n";
        return CXChildVisit_Recurse;
      },
      nullptr);
}
