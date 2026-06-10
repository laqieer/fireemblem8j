	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80455B0, "ax", %progbits
@ sub_80455B0 @ JP 0x080455B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80455B0
	.thumb_func
sub_80455B0:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080455D0 @ =0x085D367C
	adds r1, r4, #0
	bl sub_8002BCC
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x42
	adds r4, #0x44
	ldrb r0, [r0]
	ldrb r4, [r4]
	cmp r0, r4
	bne _080455D4
	movs r0, #1
	b _080455D6
	.align 2, 0
_080455D0: .4byte 0x085D367C
_080455D4:
	movs r0, #0
_080455D6:
	str r0, [r1, #0x58]
	adds r0, r1, #0
	pop {r4}
	pop {r1}
	bx r1

