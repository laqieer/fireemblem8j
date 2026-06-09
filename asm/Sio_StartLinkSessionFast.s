	.syntax unified
	.set SioSend16, 0x080424EC + 1
	.section .text.Sio_StartLinkSessionFast, "ax", %progbits
@ Sio_StartLinkSessionFast @ JP 0x08042A00 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Sio_StartLinkSessionFast
	.thumb_func
Sio_StartLinkSessionFast:
	push {r4, lr}
	sub sp, #4
	ldr r1, _08042A5C @ =0x00002586
	mov r0, sp
	strh r1, [r0]
	ldr r3, _08042A60 @ =0x085D31E8
	ldr r1, [r3]
	movs r2, #0
	movs r0, #0
	strh r0, [r1, #4]
	strb r2, [r1, #1]
	ldr r0, [r3]
	ldr r1, _08042A64 @ =0x00001B7C
	adds r0, r0, r1
	movs r1, #0x18
	strh r1, [r0]
	ldr r1, _08042A68 @ =0x030017EA
	ldr r0, _08042A6C @ =0x030017E8
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, r3, #0
	ldr r3, _08042A70 @ =0x030017F0
	ldr r2, _08042A74 @ =0x030017F8
	movs r1, #3
_08042A30:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _08042A30
	ldr r1, [r4]
	movs r0, #1
	strb r0, [r1, #1]
	ldr r1, [r4]
	movs r0, #6
	strh r0, [r1, #4]
	movs r1, #1
	rsbs r1, r1, #0
	mov r0, sp
	bl SioSend16
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08042A5C: .4byte 0x00002586
_08042A60: .4byte 0x085D31E8
_08042A64: .4byte 0x00001B7C
_08042A68: .4byte 0x030017EA
_08042A6C: .4byte 0x030017E8
_08042A70: .4byte 0x030017F0
_08042A74: .4byte 0x030017F8

