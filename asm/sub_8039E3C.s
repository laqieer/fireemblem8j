	.syntax unified
	.set sub_80407C4, 0x080407C4 + 1
	.section .text.sub_8039E3C, "ax", %progbits
@ sub_8039E3C @ JP 0x08039E3C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8039E3C
	.thumb_func
sub_8039E3C:
	push {lr}
	ldr r0, _08039E54 @ =0x0203AA00
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08039E50
	bl sub_80407C4
_08039E50:
	pop {r0}
	bx r0
	.align 2, 0
_08039E54: .4byte 0x0203AA00

