<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Helpdesk Ticket Form</title>

    <link rel="stylesheet" href="css/style.css">
</head>

<body class="helpdesk-page">

<div class="main-wrapper">

    <!-- HEADER -->
    <div class="top-header">
        <div class="logo-box">🎫</div>
        <div>
            <h1>Helpdesk Ticket Management</h1>
            <p>Local system for recording and tracking helpdesk tickets</p>
        </div>
    </div>

    <div class="progress-bar">
        <span class="active"></span>
        <span class="active"></span>
        <span></span>
    </div>

    <!-- PAGE ACTION BUTTONS -->
    <div class="page-action-row">
        <a href="${pageContext.request.contextPath}/dashboard" class="top-action-btn">← Dashboard</a>
        <a href="${pageContext.request.contextPath}/ticket-list" class="top-action-btn">View Tickets</a>
    </div>

    <!-- SUCCESS MESSAGE -->
    <% if ("1".equals(request.getParameter("success"))) { %>
        <div class="success-message">
            ✅ Ticket saved successfully.
            Ticket No: <strong><%= request.getParameter("ticketNo") %></strong>
        </div>
    <% } %>

    <!-- ERROR MESSAGE -->
    <% if (request.getAttribute("errorMessage") != null) { %>
        <div class="error-message">
            ❌ Error: <%= request.getAttribute("errorMessage") %>
        </div>
    <% } %>

    <form id="ticketForm" action="${pageContext.request.contextPath}/add-ticket" method="post" onreset="resetActionSections()">

        <!-- TICKET STATUS -->
        <div class="card">

            <div class="section-title">
                <div class="section-icon blue">📌</div>
                <div>
                    <h2>Ticket Status</h2>
                    <p>Basic ticket number, date and current status</p>
                </div>
            </div>

            <div class="form-grid">

                <div class="form-field">
                    <label>Status</label>
                    <div class="input-box">
                        <i>●</i>
                        <select name="status">
                            <option value="">-- Select Status --</option>
                            <option value="CASE OPEN">CASE OPEN</option>
                            <option value="CASE CLOSED">CASE CLOSED</option>
                            <option value="RECEIVED REPLACEMENT">RECEIVED REPLACEMENT</option>
                            <option value="PENDING USER">PENDING USER</option>
                            <option value="PENDING VENDOR">PENDING VENDOR</option>
                            <option value="PENDING PART">PENDING PART</option>
                        </select>
                    </div>
                </div>

                <div class="form-field">
                    <label>Status Detail</label>
                    <div class="input-box">
                        <i>✓</i>
                        <select name="statusDetail">
                            <option value="">-- Select Detail --</option>
                            <option value="DONE">DONE</option>
                            <option value="NOT YET">NOT YET</option>
                            <option value="WAITING CONFIRMATION">WAITING CONFIRMATION</option>
                            <option value="WAITING REPLACEMENT">WAITING REPLACEMENT</option>
                        </select>
                    </div>
                </div>

                <div class="form-field">
                    <label>CM Form Number</label>
                    <div class="input-box">
                        <i>#</i>
                        <input type="text" name="cfmFormNumber" placeholder="Example: 204555">
                    </div>
                </div>

                <div class="form-field">
                    <label>Ticket Number</label>
                    <div class="input-box">
                        <i>🎫</i>
                        <input type="text" name="ticketNumber" placeholder="Example: #506574">
                    </div>
                </div>

                <div class="form-field">
                    <label>Date</label>
                    <div class="input-box">
                        <i>📅</i>
                        <input type="date" name="ticketDate">
                    </div>
                </div>

            </div>

        </div>


        <!-- REPORTER / COURT INFORMATION -->
        <div class="card helpdesk-card-space">

            <div class="section-title">
                <div class="section-icon purple">👤</div>
                <div>
                    <h2>Reporter / Court Information</h2>
                    <p>User contact details and location of reported issue</p>
                </div>
            </div>

            <div class="form-grid">

                <div class="form-field">
                    <label>Name</label>
                    <div class="input-box">
                        <i>👤</i>
                        <input type="text" name="reporterName" placeholder="Example: Ravi AL Kasinathan">
                    </div>
                </div>

                <div class="form-field">
                    <label>Contact Number</label>
                    <div class="input-box">
                        <i>☎</i>
                        <input type="text" name="contactNumber" placeholder="Example: 016-4279890">
                    </div>
                </div>

                <div class="form-field">
                    <label>Email</label>
                    <div class="input-box">
                        <i>@</i>
                        <input type="email" name="email" placeholder="Example: user@kehakiman.gov.my">
                    </div>
                </div>

                <div class="form-field">
                    <label>Time Reported</label>
                    <div class="input-box">
                        <i>⏰</i>
                        <input type="time" name="timeReported">
                    </div>
                </div>

                <div class="form-field">
                    <label>Site</label>
                    <div class="input-box">
                        <i>🏢</i>
                        <input type="text" name="site" placeholder="Example: Mahkamah Negeri Pulau Pinang">
                    </div>
                </div>

                <div class="form-field">
                    <label>Room Location</label>
                    <div class="input-box">
                        <i>📍</i>
                        <input type="text" name="roomLocation" placeholder="Example: Mahkamah Tinggi 3JOCV2">
                    </div>
                </div>

            </div>

        </div>


        <!-- ISSUE INFORMATION -->
        <div class="card helpdesk-card-space">

            <div class="section-title">
                <div class="section-icon purple-dark">⚙</div>
                <div>
                    <h2>Issue Information</h2>
                    <p>Problem details, category, asset and root cause</p>
                </div>
            </div>

            <div class="form-grid">

                <div class="form-field full">
                    <label>Issue</label>
                    <div class="textarea-box">
                        <i>📝</i>
                        <textarea name="issue" placeholder="Describe issue here..."></textarea>
                    </div>
                </div>

                <div class="form-field">
                    <label>Category</label>
                    <div class="input-box">
                        <i>📂</i>
                        <select name="category">
                            <option value="">-- Select Category --</option>
                            <option value="Software">Software</option>
                            <option value="Hardware">Hardware</option>
                            <option value="Network">Network</option>
                            <option value="Printer">Printer</option>
                            <option value="Monitor">Monitor</option>
                            <option value="PoE Switch">PoE Switch</option>
                            <option value="CoreRVT">CoreRVT</option>
                            <option value="Others">Others</option>
                        </select>
                    </div>
                </div>

                <div class="form-field">
                    <label>Subcategory</label>
                    <div class="input-box">
                        <i>📁</i>
                        <input type="text" name="subcategory" placeholder="Example: CoreRVT / Monitor / PoE Switch">
                    </div>
                </div>

                <div class="form-field">
                    <label>Issue Type</label>
                    <div class="input-box">
                        <i>⚠</i>
                        <input type="text" name="issueType" placeholder="Example: Faulty Switch">
                    </div>
                </div>

                <div class="form-field">
                    <label>Brand / Model</label>
                    <div class="input-box">
                        <i>💻</i>
                        <input type="text" name="brandModel" placeholder="Example: H3C / OKI MB492">
                    </div>
                </div>

                <div class="form-field">
                    <label>Asset Tag</label>
                    <div class="input-box">
                        <i>🏷</i>
                        <input type="text" name="assetTag" placeholder="Example: 21980A1AIN9203Q006N">
                    </div>
                </div>

                <div class="form-field">
                    <label>Serial Number</label>
                    <div class="input-box">
                        <i>S/N</i>
                        <input type="text" name="serialNumber" placeholder="Enter serial number">
                    </div>
                </div>

                <div class="form-field full">
                    <label>Root Cause</label>
                    <div class="textarea-box">
                        <i>🔍</i>
                        <textarea name="rootCause" placeholder="Write root cause if known..."></textarea>
                    </div>
                </div>

            </div>

        </div>


        <!-- ACTION TAKEN 1 - ALWAYS SHOW -->
        <div class="card helpdesk-card-space">

            <div class="section-title">
                <div class="section-icon blue">🛠</div>
                <div>
                    <h2>Action Taken 1</h2>
                    <p>First troubleshooting action and response time record</p>
                </div>
            </div>

            <div class="form-grid">

                <div class="form-field full">
                    <label>Action Taken 1</label>
                    <div class="textarea-box">
                        <i>📝</i>
                        <textarea name="actionTaken1" placeholder="Write first action taken..."></textarea>
                    </div>
                </div>

                <div class="form-field">
                    <label>RRT 1</label>
                    <div class="input-box">
                        <i>⏱</i>
                        <input type="datetime-local" name="rrt1">
                    </div>
                </div>

                <div class="form-field">
                    <label>IRT 1</label>
                    <div class="input-box">
                        <i>⏱</i>
                        <input type="datetime-local" name="irt1">
                    </div>
                </div>

                <div class="form-field">
                    <label>ORT 1</label>
                    <div class="input-box">
                        <i>⏱</i>
                        <input type="datetime-local" name="ort1">
                    </div>
                </div>

                <div class="form-field full">
                    <label>PRT / STOP 1</label>
                    <div class="textarea-box small-textarea">
                        <i>✅</i>
                        <textarea name="prtStop1" placeholder="Example: Case Closed @03/06/2026 09:26AM"></textarea>
                    </div>
                </div>

            </div>

        </div>


        <!-- ACTION TAKEN 2 - TOGGLE -->
        <div class="card helpdesk-card-space">

            <div class="section-title section-title-between">
                <div class="section-title-left">
                    <div class="section-icon purple">🛠</div>
                    <div>
                        <h2>Action Taken 2</h2>
                        <p>Enable this only if the ticket has second follow-up action</p>
                    </div>
                </div>

                <label class="switch">
                    <input type="checkbox" id="enableAction2" name="action2Enabled" onchange="toggleAction(2)">
                    <span class="slider"></span>
                </label>
            </div>

            <div id="actionSection2" class="hidden-section">

                <div class="form-grid">

                    <div class="form-field full">
                        <label>Action Taken 2</label>
                        <div class="textarea-box">
                            <i>📝</i>
                            <textarea name="actionTaken2" placeholder="Write second action taken, if any..."></textarea>
                        </div>
                    </div>

                    <div class="form-field">
                        <label>ORT 2</label>
                        <div class="input-box">
                            <i>⏱</i>
                            <input type="datetime-local" name="ort2">
                        </div>
                    </div>

                    <div class="form-field full">
                        <label>PRT / STOP 2</label>
                        <div class="textarea-box small-textarea">
                            <i>✅</i>
                            <textarea name="prtStop2" placeholder="Write stop / closed / pending details..."></textarea>
                        </div>
                    </div>

                </div>

            </div>

        </div>


        <!-- ACTION TAKEN 3 - TOGGLE -->
        <div class="card helpdesk-card-space">

            <div class="section-title section-title-between">
                <div class="section-title-left">
                    <div class="section-icon purple-dark">🛠</div>
                    <div>
                        <h2>Action Taken 3</h2>
                        <p>Enable this only if the ticket has third follow-up action</p>
                    </div>
                </div>

                <label class="switch">
                    <input type="checkbox" id="enableAction3" name="action3Enabled" onchange="toggleAction(3)">
                    <span class="slider"></span>
                </label>
            </div>

            <div id="actionSection3" class="hidden-section">

                <div class="form-grid">

                    <div class="form-field full">
                        <label>Action Taken 3</label>
                        <div class="textarea-box">
                            <i>📝</i>
                            <textarea name="actionTaken3" placeholder="Write third action taken, if any..."></textarea>
                        </div>
                    </div>

                    <div class="form-field">
                        <label>ORT 3</label>
                        <div class="input-box">
                            <i>⏱</i>
                            <input type="datetime-local" name="ort3">
                        </div>
                    </div>

                    <div class="form-field full">
                        <label>PRT / STOP 3</label>
                        <div class="textarea-box small-textarea">
                            <i>✅</i>
                            <textarea name="prtStop3" placeholder="Write stop / closed / pending details..."></textarea>
                        </div>
                    </div>

                </div>

            </div>

        </div>


        <!-- BUTTONS -->
        <div class="button-row">
            <button type="submit">Save Ticket</button>
            <button type="reset" class="secondary-btn">Clear Form</button>
        </div>

    </form>

</div>


<script>
    function toggleAction(actionNo) {
        const checkbox = document.getElementById("enableAction" + actionNo);
        const section = document.getElementById("actionSection" + actionNo);

        if (checkbox.checked) {
            section.classList.remove("hidden-section");
        } else {
            section.classList.add("hidden-section");
            clearSectionFields(section);
        }
    }

    function clearSectionFields(section) {
        const fields = section.querySelectorAll("input, textarea, select");

        fields.forEach(function(field) {
            field.value = "";
        });
    }

    function resetActionSections() {
        setTimeout(function() {
            const action2 = document.getElementById("actionSection2");
            const action3 = document.getElementById("actionSection3");

            document.getElementById("enableAction2").checked = false;
            document.getElementById("enableAction3").checked = false;

            action2.classList.add("hidden-section");
            action3.classList.add("hidden-section");

            clearSectionFields(action2);
            clearSectionFields(action3);
        }, 0);
    }
</script>

</body>
</html>