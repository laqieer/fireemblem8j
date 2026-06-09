	.syntax unified
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.section .text.sub_804E1BC, "ax", %progbits
@ sub_804E1BC @ JP 0x0804E1BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804E1BC
	.thumb_func
sub_804E1BC:
	push {r4, r5, r6, lr}
	ldr r5, _0804E200 @ =0x085D80A8
	ldr r0, _0804E204 @ =0x0203DDD8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0804E1FA
	bl sub_8000CD8
	adds r2, r0, #0
	movs r0, #0x1f
	ands r2, r0
	asrs r2, r2, #1
	movs r1, #0
	ldr r0, _0804E208 @ =0x020228A8
	movs r4, #0xf
	ldr r6, _0804E20C @ =0x00000322
	adds r3, r0, r6
_0804E1E2:
	adds r0, r2, r1
	ands r0, r4
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strh r0, [r3]
	adds r3, #2
	adds r1, #1
	cmp r1, #0xe
	ble _0804E1E2
	bl sub_8001EE4
_0804E1FA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804E200: .4byte 0x085D80A8
_0804E204: .4byte 0x0203DDD8
_0804E208: .4byte 0x020228A8
_0804E20C: .4byte 0x00000322

