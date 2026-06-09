	.syntax unified
	.set sub_80BDEF0, 0x080BDEF0 + 1
	.set sub_80C2B14, 0x080C2B14 + 1
	.section .text.sub_80BDF94, "ax", %progbits
@ sub_80BDF94 @ JP 0x080BDF94 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BDF94
	.thumb_func
sub_80BDF94:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r2, _080BDFD8 @ =0x03005270
	ldrb r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080BDFCA
	movs r5, #4
	adds r4, r2, #0
	adds r4, #0x20
_080BDFAA:
	ldr r0, [r6, #0x54]
	adds r1, r5, #0
	bl sub_80C2B14
	movs r0, #0
	strh r0, [r4, #2]
	ldrb r1, [r4]
	movs r0, #0xfd
	ands r0, r1
	movs r1, #0xfe
	ands r0, r1
	strb r0, [r4]
	adds r4, #4
	adds r5, #1
	cmp r5, #6
	ble _080BDFAA
_080BDFCA:
	adds r0, r6, #0
	bl sub_80BDEF0
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BDFD8: .4byte 0x03005270

