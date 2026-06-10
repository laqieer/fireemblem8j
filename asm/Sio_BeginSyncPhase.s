	.syntax unified
	.set SioSend16, 0x080424EC + 1
	.section .text.Sio_BeginSyncPhase, "ax", %progbits
@ Sio_BeginSyncPhase @ JP 0x08042914 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Sio_BeginSyncPhase
	.thumb_func
Sio_BeginSyncPhase:
	push {lr}
	sub sp, #4
	ldr r1, _08042968 @ =0x00007FFF
	mov r0, sp
	strh r1, [r0]
	ldr r1, _0804296C @ =0x085D31E8
	ldr r0, [r1]
	movs r2, #0
	strb r2, [r0, #1]
	ldr r0, [r1]
	ldr r1, _08042970 @ =0x00001B7C
	adds r0, r0, r1
	strh r2, [r0]
	mov r0, sp
	movs r1, #1
	bl SioSend16
	ldr r1, _08042974 @ =0x030017EA
	ldr r0, _08042978 @ =0x030017E8
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r3, _0804297C @ =0x030017F0
	ldr r2, _08042980 @ =0x030017F8
	movs r1, #3
_08042944:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _08042944
	ldr r0, _0804296C @ =0x085D31E8
	ldr r2, [r0]
	ldr r0, _08042984 @ =0x00001B7E
	adds r1, r2, r0
	movs r0, #0
	strh r0, [r1]
	movs r0, #3
	strb r0, [r2, #1]
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08042968: .4byte 0x00007FFF
_0804296C: .4byte 0x085D31E8
_08042970: .4byte 0x00001B7C
_08042974: .4byte 0x030017EA
_08042978: .4byte 0x030017E8
_0804297C: .4byte 0x030017F0
_08042980: .4byte 0x030017F8
_08042984: .4byte 0x00001B7E

