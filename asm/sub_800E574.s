	.syntax unified
	.set sub_808C828, 0x0808C828 + 1
	.set sub_808CD14, 0x0808CD14 + 1
	.section .text.sub_800E574, "ax", %progbits
@ sub_800E574 @ JP 0x0800E574 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800E574
	.thumb_func
sub_800E574:
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r2, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	ldr r0, _0800E5C8 @ =0x030004DC
	ldrb r2, [r0]
	ldrb r1, [r0, #2]
	cmp r2, #0xff
	bne _0800E596
	cmp r1, #0xff
	bne _0800E596
	movs r2, #0
	movs r1, #0
	movs r0, #0x80
	lsls r0, r0, #1
	orrs r4, r0
_0800E596:
	ldrh r3, [r3, #0x3c]
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _0800E5A4
	movs r0, #0x80
	orrs r4, r0
_0800E5A4:
	movs r0, #0x40
	ands r0, r3
	cmp r0, #0
	beq _0800E5B0
	movs r0, #8
	orrs r4, r0
_0800E5B0:
	adds r0, r2, #0
	adds r2, r5, #0
	movs r3, #0
	bl sub_808CD14
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl sub_808C828
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800E5C8: .4byte 0x030004DC

