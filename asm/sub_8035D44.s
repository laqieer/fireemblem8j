	.syntax unified
	.set ShowUnitSprite, 0x080280C4 + 1
	.section .text.sub_8035D44, "ax", %progbits
@ sub_8035D44 @ JP 0x08035D44 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8035D44
	.thumb_func
sub_8035D44:
	push {lr}
	ldr r0, _08035D54 @ =0x03004DF0
	ldr r0, [r0]
	bl ShowUnitSprite
	pop {r0}
	bx r0
	.align 2, 0
_08035D54: .4byte 0x03004DF0

