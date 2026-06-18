	.syntax unified
	.set sub_80A2074, 0x080A2074 + 1
	.set sub_80B1474, 0x080B1474 + 1
	.set sub_80B1D98, 0x080B1D98 + 1
	.set sub_80B1FBC, 0x080B1FBC + 1
	.section .text.sub_80A280C, "ax", %progbits
@ WmSell_OnInit_ConfirmSell @ JP 0x080A280C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global WmSell_OnInit_ConfirmSell
	.thumb_func
WmSell_OnInit_ConfirmSell:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x31
	movs r0, #1
	strb r0, [r5]
	ldr r0, _080A2854 @ =sub_80A2198
	adds r1, r4, #0
	bl sub_80B1D98
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r2, [r0]
	lsls r2, r2, #4
	adds r2, #0x48
	movs r0, #0
	movs r1, #0x10
	movs r3, #2
	bl sub_80B1474
	ldrb r0, [r5]
	lsls r0, r0, #5
	adds r0, #0xa4
	movs r3, #0x80
	lsls r3, r3, #3
	movs r1, #0x6f
	movs r2, #0
	bl sub_80B1FBC
	movs r0, #1
	adds r1, r4, #0
	bl sub_80A2074
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2854: .4byte 0x080A2199  @ sub_80A2198

