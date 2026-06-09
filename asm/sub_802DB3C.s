	.syntax unified
	.set StartItemHelpBox, 0x0808B0EC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_802D520, 0x0802D520 + 1
	.set sub_804F528, 0x0804F528 + 1
	.set sub_804F5D4, 0x0804F5D4 + 1
	.section .text.sub_802DB3C, "ax", %progbits
@ sub_802DB3C @ JP 0x0802DB3C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802DB3C
	.thumb_func
sub_802DB3C:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	ldr r4, [r0, #0x14]
	adds r0, r4, #0
	bl sub_802D520
	lsls r0, r0, #0x18
	movs r1, #0x41
	adds r1, r1, r4
	mov r8, r1
	ldrb r6, [r1]
	lsls r5, r6, #2
	adds r1, r4, #0
	adds r1, #0x2c
	adds r1, r1, r5
	ldr r1, [r1]
	adds r7, r4, #0
	adds r7, #0x42
	ldrb r3, [r7]
	lsls r2, r3, #1
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r2, [r1]
	cmp r0, #0
	beq _0802DB8E
	ldr r0, _0802DC08 @ =0x085C3FBC
	adds r1, r5, r6
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r3, #0
	ldrsh r0, [r1, r3]
	lsls r0, r0, #3
	movs r3, #2
	ldrsh r1, [r1, r3]
	lsls r1, r1, #3
	bl StartItemHelpBox
_0802DB8E:
	ldr r0, _0802DC0C @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802DBA4
	mov r0, sb
	bl sub_8002DE4
_0802DBA4:
	ldr r5, _0802DC08 @ =0x085C3FBC
	mov r1, r8
	ldrb r0, [r1]
	lsls r1, r0, #2
	adds r1, r1, r0
	ldrb r7, [r7]
	adds r1, r1, r7
	lsls r1, r1, #2
	adds r1, r1, r5
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r3, #2
	ldrsh r1, [r1, r3]
	lsls r1, r1, #3
	bl sub_804F528
	adds r0, r4, #0
	adds r0, #0x45
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0802DBFA
	adds r2, r4, #0
	adds r2, #0x44
	adds r0, r4, #0
	adds r0, #0x43
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	ldrb r2, [r2]
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r5
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r3, #2
	ldrsh r1, [r1, r3]
	lsls r1, r1, #3
	bl sub_804F5D4
_0802DBFA:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802DC08: .4byte 0x085C3FBC
_0802DC0C: .4byte 0x085775CC

