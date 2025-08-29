from glue.core import Data
from glue_jupyter import JupyterApplication
from glue_jupyter.bqplot.histogram import BqplotHistogramView
from glue_jupyter.bqplot.scatter import BqplotScatterView
from ipyvuetify import VuetifyTemplate
from ipywidgets import DOMWidget, widget_serialization
from traitlets import Instance

from random import randint


class App(VuetifyTemplate):

    template_file = (__file__, "app.vue")

    histogram = Instance(DOMWidget, allow_none=True).tag(sync=True, **widget_serialization)
    scatter = Instance(DOMWidget, allow_none=True).tag(sync=True, **widget_serialization)

    def __init__(self):
        self.app = JupyterApplication()

        N = 500
        M = 50
        x = [randint(0, M) for _ in range(N)]
        y = [randint(0, M) for _ in range(N)]
        z = [randint(0, M) for _ in range(N)]
        self.data = Data(label="Data", x=x, y=y, z=z)
        self.app.data_collection.append(self.data)

        self.histogram = self.app.new_data_viewer(BqplotHistogramView, data=self.data)
        self.scatter = self.app.new_data_viewer(BqplotScatterView, data=self.data)

        super().__init__()

    
