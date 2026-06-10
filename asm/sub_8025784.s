	.syntax unified
	.set AddTarget, 0x08050630 + 1
	.set sub_8085528, 0x08085528 + 1
	.section .text.sub_8025784, "ax", %progbits
@ sub_8025784 @ JP 0x08025784 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8025784
	.thumb_func
sub_8025784:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080257C0 @ =0x0202E4D8
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x14
	bne _080257BA
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	bl sub_8085528
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080257BA
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x14
	movs r3, #0
	bl AddTarget
_080257BA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080257C0: .4byte 0x0202E4D8

