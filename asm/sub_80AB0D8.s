	.syntax unified
	.set GetSaveReadAddr, 0x080A7B58 + 1
	.set sub_80D65C8, 0x080D65C8 + 1
	.section .text.sub_80AB0D8, "ax", %progbits
@ sub_80AB0D8 @ JP 0x080AB0D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AB0D8
	.thumb_func
sub_80AB0D8:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #5
	bl GetSaveReadAddr
	ldr r2, _080AB100 @ =0x03006790
	movs r1, #0xc4
	muls r1, r4, r1
	adds r0, r0, r1
	ldr r3, [r2]
	adds r1, r5, #0
	movs r2, #0xc4
	bl sub_80D65C8
	ldrb r0, [r5]
	cmp r0, #0
	beq _080AB104
	movs r0, #1
	b _080AB106
	.align 2, 0
_080AB100: .4byte 0x03006790
_080AB104:
	movs r0, #0
_080AB106:
	pop {r4, r5}
	pop {r1}
	bx r1

