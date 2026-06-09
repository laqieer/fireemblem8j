	.syntax unified
	.set SioSend16, 0x080424EC + 1
	.section .text.Sio_StartLinkSession, "ax", %progbits
@ Sio_StartLinkSession @ JP 0x08042988 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Sio_StartLinkSession
	.thumb_func
Sio_StartLinkSession:
	push {r4, lr}
	sub sp, #4
	ldr r1, _080429E4 @ =0x00002586
	mov r0, sp
	strh r1, [r0]
	ldr r3, _080429E8 @ =0x085D31E8
	ldr r1, [r3]
	movs r2, #0
	movs r0, #0
	strh r0, [r1, #4]
	strb r2, [r1, #1]
	ldr r0, [r3]
	ldr r1, _080429EC @ =0x00001B7C
	adds r0, r0, r1
	movs r1, #0x88
	strh r1, [r0]
	ldr r1, _080429F0 @ =0x030017EA
	ldr r0, _080429F4 @ =0x030017E8
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, r3, #0
	ldr r3, _080429F8 @ =0x030017F0
	ldr r2, _080429FC @ =0x030017F8
	movs r1, #3
_080429B8:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _080429B8
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
_080429E4: .4byte 0x00002586
_080429E8: .4byte 0x085D31E8
_080429EC: .4byte 0x00001B7C
_080429F0: .4byte 0x030017EA
_080429F4: .4byte 0x030017E8
_080429F8: .4byte 0x030017F0
_080429FC: .4byte 0x030017F8

