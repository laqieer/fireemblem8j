	.syntax unified
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.section .text.sub_8068738, "ax", %progbits
@ sub_8068738 @ JP 0x08068738 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8068738
	.thumb_func
sub_8068738:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	mov sb, r1
	ldr r0, [sp, #0x28]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov sl, r2
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	str r3, [sp, #4]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _08068790 @ =0x080E3920
	ldr r6, [r0]
	ldr r7, [r0, #4]
	ldr r1, _08068794 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08068798 @ =0x08601E7C
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	mov r0, r8
	bl GetAnimAnotherSide
	str r0, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	mov r0, sb
	strh r0, [r5, #0x2e]
	cmp r4, #0
	beq _0806878A
	cmp r4, #1
	beq _0806879C
_0806878A:
	adds r3, r6, #0
	b _0806879E
	.align 2, 0
_08068790: .4byte 0x080E3920
_08068794: .4byte 0x0201774C
_08068798: .4byte 0x08601E7C
_0806879C:
	adds r3, r7, #0
_0806879E:
	ldr r0, [r5, #0x5c]
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	str r0, [r5, #0x60]
	mov r1, sl
	strh r1, [r0, #2]
	mov r2, sp
	ldrh r2, [r2, #4]
	strh r2, [r0, #4]
	ldrh r2, [r0, #8]
	ldr r1, _080687D8 @ =0x0000F3FF
	ands r1, r2
	movs r3, #0x80
	lsls r3, r3, #3
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0, #8]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080687D8: .4byte 0x0000F3FF

