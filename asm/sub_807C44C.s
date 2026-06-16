	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set AdjustNewUnitPosition, 0x0807C8DC + 1
	.section .text.sub_807C44C, "ax", %progbits
@ sub_807C44C @ JP 0x0807C44C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807C44C
	.thumb_func
sub_807C44C:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	ldrb r0, [r4, #7]
	cmp r0, #0
	beq _0807C4C0
	rsbs r0, r3, #0
	orrs r0, r3
	lsrs r5, r0, #0x1f
	ldrb r1, [r4, #5]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0807C474
	movs r0, #2
	orrs r5, r0
_0807C474:
	ldrb r0, [r4]
	bl GetUnit
	ldrb r1, [r4, #7]
	lsls r1, r1, #3
	subs r1, #8
	ldr r3, [r4, #8]
	adds r3, r3, r1
	ldrb r1, [r3]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1a
	ldr r4, _0807C4B8 @ =0xFFFF0000
	ldr r2, [sp]
	ands r2, r4
	orrs r2, r1
	str r2, [sp]
	ldrh r1, [r3]
	lsls r1, r1, #0x14
	lsrs r1, r1, #0x1a
	lsls r1, r1, #0x10
	ldr r3, _0807C4BC @ =0x0000FFFF
	ands r2, r3
	orrs r2, r1
	str r2, [sp]
	mov r4, sp
	mov r1, sp
	adds r2, r5, #0
	bl AdjustNewUnitPosition
	mov r0, sp
	ldrh r0, [r0]
	strb r0, [r6]
	ldrh r0, [r4, #2]
	b _0807C4CE
	.align 2, 0
_0807C4B8: .4byte 0xFFFF0000
_0807C4BC: .4byte 0x0000FFFF
_0807C4C0:
	ldrb r0, [r4, #4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1a
	strb r0, [r6]
	ldrh r0, [r4, #4]
	lsls r0, r0, #0x14
	lsrs r0, r0, #0x1a
_0807C4CE:
	strb r0, [r7]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

