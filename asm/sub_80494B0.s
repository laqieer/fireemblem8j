	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80494B0, "ax", %progbits
@ sub_80494B0 @ JP 0x080494B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80494B0
	.thumb_func
sub_80494B0:
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x54]
	ldr r0, [r0, #0x50]
	cmp r0, #0
	bne _080494C2
	adds r0, r1, #0
	bl sub_8002DE4
_080494C2:
	pop {r0}
	bx r0
	.align 2, 0

