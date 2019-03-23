const token = document.querySelector('meta[name="csrf-token"]')
                .getAttribute('content')

export const headers = {
                  'X-Requested-With': 'XMLHttpRequest',
                  'X-CSRF-TOKEN':     token,
                  'content-type':     'multipart/form-data'
                }