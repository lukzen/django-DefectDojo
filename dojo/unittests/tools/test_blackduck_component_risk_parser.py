from django.test import TestCase
from dojo.tools.blackduck_component_risk.parser import BlackduckComponentRiskParser
from dojo.models import Test
from pathlib import Path


class TestBlackduckComponentRiskParser(TestCase):
    def test_blackduck_enhanced_zip_upload(self):
        testfile = Path(
            "dojo/unittests/scans/blackduck_component_risk/"
            "blackduck_hub_component_risk.zip"
        )
        parser = BlackduckComponentRiskParser()
        findings = parser.get_findings(testfile, Test())
        self.assertEqual(12, len(findings))