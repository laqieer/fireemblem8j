	.syntax unified
	.set GetSaveReadAddr, 0x080A7B58 + 1
	.set sub_80D65C8, 0x080D65C8 + 1
	.section .text.sub_80AB458, "ax", %progbits
@ sub_80AB458 @ JP 0x080AB458 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AB458
	.thumb_func
sub_80AB458:
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #5
	bl GetSaveReadAddr
	ldr r1, _080AB47C @ =0x03006790
	movs r2, #0xf5
	lsls r2, r2, #3
	adds r0, r0, r2
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #2
	bl sub_80D65C8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AB47C: .4byte 0x03006790

