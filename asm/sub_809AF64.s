	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_809AF64, "ax", %progbits
@ PutImg_PrepPopupWindow @ JP 0x0809AF64 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global PutImg_PrepPopupWindow
	.thumb_func
PutImg_PrepPopupWindow:
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _0809AF8C @ =0x08A9A328
	ldr r1, _0809AF90 @ =0x06010000
	adds r2, r2, r1
	adds r1, r2, #0
	bl sub_8013008
	ldr r0, _0809AF94 @ =0x085E0DF4
	adds r4, #0x10
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0x20
	bl sub_8000D68
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809AF8C: .4byte 0x08A9A328
_0809AF90: .4byte 0x06010000
_0809AF94: .4byte 0x085E0DF4

