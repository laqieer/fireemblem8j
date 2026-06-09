	.syntax unified
	.set error, 0x080DA4B8 + 1
	.set findslot, 0x080DA3C8 + 1
	.set strlen, 0x080D6A08 + 1
	.section .text.sub_80DA650, "ax", %progbits
@ sub_80DA650 @ JP 0x080DA650 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80DA650
	.thumb_func
sub_80DA650:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	adds r7, r0, #0
	adds r4, r1, #0
	movs r5, #0
	movs r6, #1
	rsbs r6, r6, #0
	adds r0, r6, #0
	bl findslot
	mov r8, r0
	cmp r0, #0x14
	bne _080DA672
	adds r0, r6, #0
	b _080DA6E6
_080DA672:
	movs r0, #2
	ands r0, r4
	cmp r0, #0
	beq _080DA67C
	movs r5, #2
_080DA67C:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r4
	cmp r0, #0
	beq _080DA68A
	movs r0, #4
	orrs r5, r0
_080DA68A:
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r4
	cmp r0, #0
	beq _080DA698
	movs r0, #4
	orrs r5, r0
_080DA698:
	movs r1, #8
	ands r4, r1
	cmp r4, #0
	beq _080DA6A8
	movs r0, #5
	rsbs r0, r0, #0
	ands r5, r0
	orrs r5, r1
_080DA6A8:
	str r7, [sp]
	adds r0, r7, #0
	bl strlen
	str r0, [sp, #8]
	str r5, [sp, #4]
	movs r2, #1
	adds r0, r2, #0
	mov r1, sp
	svc #0xab
	adds r3, r0, #0
	cmp r3, #0
	blt _080DA6E0
	ldr r0, _080DA6DC @ =0x03002B40
	mov r1, r8
	lsls r2, r1, #3
	adds r1, r2, r0
	str r3, [r1]
	adds r0, #4
	adds r2, r2, r0
	movs r0, #0
	str r0, [r2]
	adds r0, r3, #0
	adds r0, #0x20
	b _080DA6E6
	.align 2, 0
_080DA6DC: .4byte 0x03002B40
_080DA6E0:
	adds r0, r3, #0
	bl error
_080DA6E6:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7, pc}
	.align 2, 0

