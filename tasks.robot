*** Settings ***
Documentation       Insert the sales data for the week and export it as a PDF.

Library             RPA.Browser.Selenium    auto_close=${FALSE}
Library             RPA.Excel.Files
Library             RPA.HTTP
Library             RPA.PDF


*** Tasks ***
Insert the sales data for the week and export it as a PDF
    Open the intranet website
    Collect the results
    Export the table as a PDF
    [Teardown]    Close the browser


*** Keywords ***
Open the intranet website
    Open Available Browser
    ...    http://mis.hvnh.edu.vn/tin_tuc/chi_tiet/524_sis_viet_nam_tuyen_chuyen_vien_tu_van_trien_khai.html

Collect the results
    Screenshot    css:div.ed-about-tit    ${OUTPUT_DIR}${/}bai_viet_tuyen_dung.png

Export the table as a PDF
    Wait Until Element Is Visible    class:ed-about-tit
    ${tuyen_dung_results_html}=    Get Element Attribute    class:ed-about-tit    outerHTML
    Html To Pdf    ${tuyen_dung_results_html}    ${OUTPUT_DIR}${/}bai_viet_tuyen_dung.pdf

Close the browser
    Close Browser
