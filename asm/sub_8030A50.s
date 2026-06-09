	.syntax unified
	.set PutSprite, 0x080052F0 + 1
	.set __divsi3, 0x080D65F8 + 1
	.section .text.sub_8030A50, "ax", %progbits
@ sub_8030A50 @ JP 0x08030A50 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8030A50
	.thumb_func
sub_8030A50:
	push {lr}
	sub sp, #4
	ldr r0, _08030A78 @ =0x0202BCAC
	movs r1, #0xe
	ldrsh r0, [r0, r1]
	movs r1, #5
	bl __divsi3
	adds r2, r0, #0
	rsbs r2, r2, #0
	ldr r3, _08030A7C @ =0x085C5E54
	ldr r0, _08030A80 @ =0x0000AC12
	str r0, [sp]
	movs r0, #0xe
	movs r1, #0
	bl PutSprite
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08030A78: .4byte 0x0202BCAC
_08030A7C: .4byte 0x085C5E54
_08030A80: .4byte 0x0000AC12

