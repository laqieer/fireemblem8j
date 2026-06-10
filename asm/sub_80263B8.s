	.syntax unified
	.set GetSelectTargetCount, 0x08050A9C + 1
	.set GetTarget, 0x08050AA8 + 1
	.set GetUnit, 0x08019108 + 1
	.set sub_8018E64, 0x08018E64 + 1
	.set sub_80A8FD8, 0x080A8FD8 + 1
	.set sub_80A90C8, 0x080A90C8 + 1
	.section .text.sub_80263B8, "ax", %progbits
@ sub_80263B8 @ JP 0x080263B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80263B8
	.thumb_func
sub_80263B8:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	bl GetSelectTargetCount
	adds r7, r0, #0
	movs r6, #0
	cmp r6, r7
	bge _08026404
_080263CC:
	adds r0, r6, #0
	bl GetTarget
	adds r4, r0, #0
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r5, r0, #0
	bl sub_8018E64
	movs r1, #3
	ldrsb r1, [r4, r1]
	cmp r0, r1
	bgt _080263FE
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	movs r1, #0
	mov r2, r8
	bl sub_80A90C8
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	bl sub_80A8FD8
_080263FE:
	adds r6, #1
	cmp r6, r7
	blt _080263CC
_08026404:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

