	.syntax unified
	.set ShowMu, 0x0807BBF0 + 1
	.section .text.sub_8084120, "ax", %progbits
@ sub_8084120 @ JP 0x08084120 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8084120
	.thumb_func
sub_8084120:
	push {lr}
	ldr r2, _08084140 @ =0x0203E1EC
	adds r0, r2, #0
	adds r0, #0x59
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #8
	adds r0, r0, r2
	ldr r0, [r0]
	bl ShowMu
	pop {r0}
	bx r0
	.align 2, 0
_08084140: .4byte 0x0203E1EC

