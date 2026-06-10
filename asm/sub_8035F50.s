	.syntax unified
	.set GetSelectTargetCount, 0x08050A9C + 1
	.set GetTarget, 0x08050AA8 + 1
	.set GetUnit, 0x08019108 + 1
	.set Proc_End, 0x08002CBC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_8018E64, 0x08018E64 + 1
	.section .text.sub_8035F50, "ax", %progbits
@ sub_8035F50 @ JP 0x08035F50 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8035F50
	.thumb_func
sub_8035F50:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r7, #0
	adds r5, #0x4c
	movs r1, #0
	ldrsh r0, [r5, r1]
	bl GetTarget
	adds r4, r0, #0
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r6, r0, #0
	ldr r1, _08035F88 @ =0x0203A954
	ldrb r0, [r4, #2]
	strb r0, [r1, #0xc]
	movs r0, #0
	ldrsh r4, [r5, r0]
	bl GetSelectTargetCount
	cmp r4, r0
	bne _08035F8C
	adds r0, r7, #0
	bl Proc_End
	b _08035FD2
	.align 2, 0
_08035F88: .4byte 0x0203A954
_08035F8C:
	ldr r0, _08035FB8 @ =0x0202BCEC
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _08035FC0
	movs r0, #0x11
	ldrsb r0, [r6, r0]
	ldr r1, _08035FBC @ =0x0202E4E4
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r6, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _08035FC0
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
	b _08035FD2
	.align 2, 0
_08035FB8: .4byte 0x0202BCEC
_08035FBC: .4byte 0x0202E4E4
_08035FC0:
	adds r0, r6, #0
	bl sub_8018E64
	cmp r0, #0
	bne _08035FD2
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
_08035FD2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

