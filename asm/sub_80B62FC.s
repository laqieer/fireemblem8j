	.syntax unified
	.set GetGameOption, 0x080B6A00 + 1
	.section .text.sub_80B62FC, "ax", %progbits
@ sub_80B62FC @ JP 0x080B62FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B62FC
	.thumb_func
sub_80B62FC:
	push {lr}
	ldr r1, _080B6318 @ =0x08AAF6DC
	ldr r0, _080B631C @ =0x08AAF6D8
	ldr r0, [r0]
	movs r2, #0x2a
	ldrsh r0, [r0, r2]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetGameOption
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_080B6318: .4byte 0x08AAF6DC
_080B631C: .4byte 0x08AAF6D8

