	.syntax unified
	.set SetMuScreenPosition, 0x0807BBF8 + 1
	.section .text.sub_8084144, "ax", %progbits
@ sub_8084144 @ JP 0x08084144 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8084144
	.thumb_func
sub_8084144:
	push {r4, r5, r6, lr}
	ldr r2, _08084184 @ =0x0203E1EC
	adds r0, r2, #0
	adds r0, #0x59
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r2
	ldr r6, [r1]
	adds r1, r2, #0
	adds r1, #8
	adds r0, r0, r1
	ldr r0, [r0]
	adds r5, r2, #0
	adds r5, #0x60
	ldrb r1, [r5]
	lsls r1, r1, #4
	adds r4, r2, #0
	adds r4, #0x61
	ldrb r2, [r4]
	lsls r2, r2, #4
	bl SetMuScreenPosition
	ldrb r0, [r5]
	strb r0, [r6, #0x10]
	ldrb r0, [r4]
	strb r0, [r6, #0x11]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08084184: .4byte 0x0203E1EC

