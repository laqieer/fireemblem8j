	.syntax unified
	.section .text.sub_8018FCC, "ax", %progbits
@ sub_8018FCC @ JP 0x08018FCC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8018FCC
	.thumb_func
sub_8018FCC:
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2]
	ldrh r0, [r1, #6]
	cmp r0, #0
	bne _08018FE6
	ldr r1, [r2, #4]
	ldrh r0, [r1, #8]
	cmp r0, #0
	bne _08018FE4
	movs r0, #0
	b _08018FE6
_08018FE4:
	ldrh r0, [r1, #8]
_08018FE6:
	pop {r1}
	bx r1
	.align 2, 0

