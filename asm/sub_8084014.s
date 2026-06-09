	.syntax unified
	.set sub_807BC18, 0x0807BC18 + 1
	.section .text.sub_8084014, "ax", %progbits
@ sub_8084014 @ JP 0x08084014 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8084014
	.thumb_func
sub_8084014:
	push {lr}
	ldr r2, _08084034 @ =0x0203E1EC
	adds r0, r2, #0
	adds r0, #0x59
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #8
	adds r0, r0, r2
	ldr r0, [r0]
	movs r1, #0
	bl sub_807BC18
	pop {r0}
	bx r0
	.align 2, 0
_08084034: .4byte 0x0203E1EC

