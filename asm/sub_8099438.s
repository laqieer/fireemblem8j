	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set Proc_Find, 0x08002DEC + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8004374, 0x08004374 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_804F0EC, 0x0804F0EC + 1
	.section .text.sub_8099438, "ax", %progbits
@ sub_8099438 @ JP 0x08099438 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8099438
	.thumb_func
sub_8099438:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r0, _080994DC @ =0x08A94430
	bl Proc_Find
	mov r8, r0
	cmp r0, #0
	beq _080994CE
	movs r0, #0
	mov r1, r8
	strh r6, [r1, #0x34]
	strh r5, [r1, #0x36]
	mov r4, r8
	adds r4, #0x2b
	ldrb r3, [r4]
	lsls r3, r3, #1
	adds r3, #2
	str r0, [sp]
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #0xa
	bl sub_804F0EC
	ldrb r0, [r4]
	mov sb, r4
	cmp r0, #1
	bls _080994C8
	movs r7, #0
	ldrb r0, [r4]
	cmp r7, r0
	bge _080994C8
	adds r0, r5, #1
	lsls r0, r0, #5
	adds r0, #2
	adds r6, r0, r6
_08099488:
	lsls r1, r7, #2
	mov r0, r8
	adds r0, #0x38
	adds r0, r0, r1
	ldr r4, [r0]
	adds r5, r4, #0
	adds r5, #0x3c
	adds r0, r5, #0
	bl sub_8003CF8
	ldr r0, [r4, #0x34]
	bl sub_8009FA8
	lsls r1, r6, #1
	ldr r2, _080994E0 @ =0x02022CA8
	adds r1, r1, r2
	adds r4, #0x38
	ldrb r3, [r4]
	movs r2, #1
	ands r2, r3
	movs r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	bl sub_8004374
	adds r6, #0x40
	adds r7, #1
	mov r1, sb
	ldrb r1, [r1]
	cmp r7, r1
	blt _08099488
_080994C8:
	movs r0, #3
	bl BG_EnableSyncByMask
_080994CE:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080994DC: .4byte 0x08A94430
_080994E0: .4byte 0x02022CA8

