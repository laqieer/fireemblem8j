	.syntax unified
	.set sub_8002EE8, 0x08002EE8 + 1
	.section .text.sub_807BF0C, "ax", %progbits
@ sub_807BF0C @ JP 0x0807BF0C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807BF0C
	.thumb_func
sub_807BF0C:
	push {lr}
	ldr r0, _0807BF1C @ =0x08A132D0
	ldr r1, _0807BF20 @ =MuMaxWalkSpeedFunc
	bl sub_8002EE8
	pop {r0}
	bx r0
	.align 2, 0
_0807BF1C: .4byte 0x08A132D0
_0807BF20: .4byte 0x0807BF25  @ MuMaxWalkSpeedFunc

