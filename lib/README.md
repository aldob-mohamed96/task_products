Title
===
Abstract:xxx
## Papar Information
- Title:  `paper name`
- Authors:  `A`,`B`,`C`
- Preprint: [https://arxiv.org/abs/xx]()
- Full-preprint: [paper position]()
- Video: [video position]()

## Install & Dependence
- python
- pytorch
- numpy

## Dataset Preparation
| Dataset | Download |
| ---     | ---   |
| dataset-A | [download]() |
| dataset-B | [download]() |
| dataset-C | [download]() |

## Use
- for train
  ```
  python train.py
  ```
- for test
  ```
  python test.py
  ```
## Pretrained model
| Model | Download |
| ---     | ---   |
| Model-1 | [download]() |
| Model-2 | [download]() |
| Model-3 | [download]() |


## Directory Hierarchy
```
|—— .DS_Store
|—— README.md
|—— app
|    |—— devlopment.dart
|    |—— production.dart
|    |—— testing.dart
|—— core
|    |—— .DS_Store
|    |—— di
|        |—— locator.dart
|    |—— enum
|        |—— enums.dart
|    |—— error
|        |—— error_handler.dart
|        |—— failure.dart
|    |—— extension
|        |—— api_url.dart
|        |—— bloc.dart
|        |—— context.dart
|        |—— data_source.dart
|        |—— data_type.dart
|        |—— functions.dart
|        |—— widget.dart
|    |—— input_validation_form
|        |—— input_form.dart
|        |—— validation.dart
|    |—— logger
|        |—— logger.dart
|    |—— network
|        |—— api.dart
|        |—— dio_factory.dart
|    |—— resources_manager
|        |—— api_codes.dart
|        |—— api_messages.dart
|        |—— assets.dart
|        |—— color.dart
|        |—— constant.dart
|        |—— font.dart
|        |—— strings.dart
|        |—— values.dart
|    |—— routes
|        |—— pages.dart
|        |—— routes.dart
|    |—— service
|        |—— app_preferance.dart
|        |—— base_usecase.dart
|        |—— bottom_nav_bar.dart
|        |—— network_info.dart
|    |—— widgets
|        |—— empty_content.dart
|        |—— error_content.dart
|        |—— font.dart
|        |—— image_network.dart
|        |—— input.dart
|        |—— input_border.dart
|        |—— loading.dart
|        |—— main_screen.dart
|        |—— show_dialog_snackbar.dart
|—— features
|    |—— auth
|        |—— data
|            |—— data_source
|                |—— local_data_source
|                    |—— local_data_source.dart
|                |—— remote_data_source
|                    |—— remote_data_source.dart
|            |—— repository_impl
|                |—— auth_repository_impl.dart
|            |—— request
|                |—— auth_request.dart
|        |—— domain
|            |—— entity
|                |—— user.dart
|            |—— repository
|                |—— auth_repository.dart
|            |—— usecase
|                |—— change_authentication_usecase.dart
|                |—— get_authentication_usecase.dart
|                |—— login_usecase.dart
|                |—— logout_usecase.dart
|        |—— presentation
|            |—— logic
|                |—— authentication
|                    |—— authentication_cubit.dart
|                    |—— authentication_state.dart
|                |—— login
|                    |—— login_cubit.dart
|                    |—— login_state.dart
|                |—— register
|            |—— view
|                |—— login
|                    |—— login_screen.dart
|                    |—— widgets
|    |—— cart
|        |—— data
|            |—— data_source
|                |—— local_data_source
|                    |—— local_data_source.dart
|                |—— remote_data_source
|            |—— repositories_impl
|                |—— cart_repository_impl.dart
|            |—— response
|                |—— cart_response.dart
|                |—— cart_response.g.dart
|        |—— domain
|            |—— entity
|                |—— cart_item.dart
|            |—— repositories
|                |—— cart_repository.dart
|            |—— usecase
|                |—— add_item_cart_usecase.dart
|                |—— clear_cart_usecase.dart
|                |—— delete_item_cart_usecase.dart
|                |—— get_all_items_cart_usecase.dart
|                |—— get_cart_count_usecase.dart
|                |—— get_item_cart_usecase.dart
|                |—— update_item_cart_usecase.dart
|        |—— presentation
|            |—— logic
|                |—— cart
|                    |—— cart_cubit.dart
|                    |—— cart_state.dart
|            |—— view
|                |—— cart_screen.dart
|                |—— widget
|                    |—— cartItem_view.dart
|    |—— home
|        |—— data
|            |—— data_source
|                |—— local_data_souce
|                |—— remote_data_source
|                    |—— remote_data_source.dart
|            |—— mapper
|                |—— product_mapper.dart
|            |—— repository_impl
|                |—— repository_impl.dart
|        |—— domain
|            |—— entity
|                |—— product.dart
|            |—— repository
|                |—— repository.dart
|            |—— usecase
|                |—— get_product_usecase.dart
|        |—— presentation
|            |—— logic
|                |—— home
|                    |—— home_cubit.dart
|                    |—— home_state.dart
|            |—— view
|                |—— home
|                    |—— home_screen.dart
|                    |—— product_cart.dart
|                    |—— show_product_details.dart
|—— main.dart
```
## Code Details
### Tested Platform
- software
  ```
  OS: Debian unstable (May 2021), Ubuntu LTS
  Python: 3.8.5 (anaconda)
  PyTorch: 1.7.1, 1.8.1
  ```
- hardware
  ```
  CPU: Intel Xeon 6226R
  GPU: Nvidia RTX3090 (24GB)
  ```
### Hyper parameters
```
```
## References
- [paper-1]()
- [paper-2]()
- [code-1](https://github.com)
- [code-2](https://github.com)
  
## License

## Citing
If you use xxx,please use the following BibTeX entry.
```
```
