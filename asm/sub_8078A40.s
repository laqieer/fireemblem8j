	.syntax unified
	.section .text.sub_8078A40, "ax", %progbits
@ sub_8078A40 @ JP 0x08078A40 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8078A40
	.thumb_func
sub_8078A40:
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _08078A5C @ =0x02019790
	lsrs r1, r0, #0x10
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #3
_08078A4E:
	stm r2!, {r1}
	subs r0, #1
	cmp r0, #0
	bne _08078A4E
	pop {r0}
	bx r0
	.align 2, 0
_08078A5C: .4byte 0x02019790

