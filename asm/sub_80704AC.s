	.syntax unified
	.set AnimSort, 0x08004EB4 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set SetAnimStateHidden, 0x0805B0FC + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.section .text.sub_80704AC, "ax", %progbits
@ sub_80704AC @ JP 0x080704AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80704AC
	.thumb_func
sub_80704AC:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r6, r0, #0
	cmp r1, #0
	bne _080704BE
	ldr r4, _08070518 @ =0x0877BA14
	ldr r7, _0807051C @ =0x0877BC18
_080704BE:
	ldr r0, _08070520 @ =0x08603950
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	mov r8, r0
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r4, [sp]
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r4, #0
	adds r3, r7, #0
	bl sub_80564F0
	adds r4, r0, #0
	str r4, [r5, #0x60]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	ldr r1, _08070524 @ =0x02000010
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r5, #0x60]
	str r1, [r0]
	ldrh r1, [r4, #8]
	movs r0, #0xc0
	lsls r0, r0, #4
	ands r0, r1
	strh r0, [r4, #8]
	movs r0, #0x64
	strh r0, [r4, #0xa]
	bl AnimSort
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08070528
	ldrh r0, [r4, #8]
	movs r2, #0xe4
	lsls r2, r2, #7
	b _0807052E
	.align 2, 0
_08070518: .4byte 0x0877BA14
_0807051C: .4byte 0x0877BC18
_08070520: .4byte 0x08603950
_08070524: .4byte 0x02000010
_08070528:
	ldrh r0, [r4, #8]
	movs r2, #0x93
	lsls r2, r2, #8
_0807052E:
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4, #8]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	bl SetAnimStateHidden
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

