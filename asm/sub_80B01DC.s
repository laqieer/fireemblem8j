	.syntax unified
	.set ClearBgVerticalScrollChannelFlags, 0x08014F1C + 1
	.set SetBgVerticalScrollPosition, 0x08014EEC + 1
	.set sub_80AF4B8, 0x080AF4B8 + 1
	.section .text.sub_80B01DC, "ax", %progbits
@ sub_80B01DC @ JP 0x080B01DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B01DC
	.thumb_func
sub_80B01DC:
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #0
	strh r0, [r1]
	strh r0, [r4, #0x3e]
	ldr r1, _080B0210 @ =0x04000018
	bl SetBgVerticalScrollPosition
	movs r0, #0
	bl ClearBgVerticalScrollChannelFlags
	adds r0, r4, #0
	bl sub_80AF4B8
	ldr r0, _080B0214 @ =0x03004930
	ldr r0, [r0]
	ldr r1, _080B0218 @ =0x0000079E
	adds r0, r0, r1
	movs r1, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B0210: .4byte 0x04000018
_080B0214: .4byte 0x03004930
_080B0218: .4byte 0x0000079E

