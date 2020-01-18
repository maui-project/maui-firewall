
/*
 * Copyright 2018 Alexis Lopes Zubeta <contact@azubieta.net>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License or (at your option) version 3 or any later version
 * accepted by the membership of KDE e.V. (or its successor approved
 * by the membership of KDE e.V.), which shall act as a proxy
 * defined in Section 14 of version 3 of the license.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 1.4


import QtQuick.Controls 2.12 as QQC2

import org.kde.kirigami 2.4 as Kirigami


import org.nomad.ufw 1.0 as UFW

ColumnLayout {
    StackLayout {
        id: mainLayout

        ColumnLayout {
            GlobalRules {
            }

            DynamicFirewallRules {
                onRequestRuleEdition : {
                    ruleEdit.rule = rule
                    ruleEdit.newRule = false
                    mainLayout.currentIndex = 1
                }
            }

            QQC2.ToolButton {
                height: 48
                icon.name: "list-add"
                text: i18n("New Rule")
                onClicked: {
                    mainLayout.currentIndex = 1
                    ruleEdit.newRule = true
                }
            }
        }

        // Remove this from stack layout in the future.
        RuleEdit {
            id: ruleEdit
            onAccept: mainLayout.currentIndex = 0
            onReject: mainLayout.currentIndex = 0
        }
    }
}
