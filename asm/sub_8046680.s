	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.set SioSend, 0x08042238 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8046680, "ax", %progbits
@ sub_8046680 @ JP 0x08046680 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8046680
	.thumb_func
sub_8046680:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _080466A0
	ldr r0, _08046714 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080466A0
	movs r0, #0x7c
	bl m4aSongNumStart
_080466A0:
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	movs r6, #0
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x17
	ble _080466B6
	strh r6, [r1]
_080466B6:
	ldr r0, _08046718 @ =0x0203DD24
	ldr r1, [r0]
	adds r1, #1
	str r1, [r0]
	movs r0, #0x96
	lsls r0, r0, #2
	cmp r1, r0
	ble _080466CA
	bl StartSioErrorScreen
_080466CA:
	ldr r0, _0804671C @ =0x03004EFC
	movs r1, #0xc9
	strb r1, [r0]
	ldr r4, _08046720 @ =0x085D31E8
	ldr r1, [r4]
	ldrb r1, [r1, #6]
	strb r1, [r0, #1]
	strh r6, [r0, #2]
	movs r1, #4
	bl SioSend
	ldr r4, [r4]
	ldr r1, [r5, #0x58]
	movs r0, #0x8c
	muls r0, r1, r0
	adds r0, r4, r0
	movs r1, #0x9a
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrb r1, [r4, #9]
	ldrb r2, [r0]
	cmp r2, r1
	bne _0804670C
	ldrb r0, [r4, #0xa]
	ands r0, r1
	cmp r0, r2
	bne _0804670C
	ldr r0, _08046724 @ =0x085D32A8
	bl Proc_EndEach
	adds r0, r5, #0
	bl sub_8002DE4
_0804670C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08046714: .4byte 0x0202BCEC
_08046718: .4byte 0x0203DD24
_0804671C: .4byte 0x03004EFC
_08046720: .4byte 0x085D31E8
_08046724: .4byte 0x085D32A8

