	.syntax unified
	.set GetSaveReadAddr, 0x080A7B58 + 1
	.set sub_80AA1AC, 0x080AA1AC + 1
	.set sub_80D65C8, 0x080D65C8 + 1
	.section .text.sub_80AB354, "ax", %progbits
@ sub_80AB354 @ JP 0x080AB354 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AB354
	.thumb_func
sub_80AB354:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r6, r1, #0
	adds r5, r2, #0
	movs r0, #5
	bl GetSaveReadAddr
	adds r7, r0, #0
	ldr r1, _080AB3A8 @ =0x03006790
	movs r0, #0xc4
	mov r4, r8
	muls r4, r0, r4
	adds r0, r7, r4
	ldr r3, [r1]
	adds r1, r5, #0
	movs r2, #0xf
	bl sub_80D65C8
	adds r4, #0x10
	adds r4, r7, r4
	movs r5, #4
_080AB382:
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_80AA1AC
	adds r6, #0x48
	adds r4, #0x24
	subs r5, #1
	cmp r5, #0
	bge _080AB382
	movs r0, #0xc4
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	adds r0, r7, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _080AB3AC
	movs r0, #1
	b _080AB3AE
	.align 2, 0
_080AB3A8: .4byte 0x03006790
_080AB3AC:
	movs r0, #0
_080AB3AE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

