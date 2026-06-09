	.syntax unified
	.set sub_8001EE4, 0x08001EE4 + 1
	.section .text.sub_80AF28C, "ax", %progbits
@ sub_80AF28C @ JP 0x080AF28C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AF28C
	.thumb_func
sub_80AF28C:
	push {r4, r5, lr}
	movs r2, #0x3f
	ands r2, r0
	asrs r2, r2, #2
	ldr r4, _080AF2BC @ =0x020228A8
	lsls r2, r2, #1
	ldr r0, _080AF2C0 @ =0x08AA52DC
	adds r2, r2, r0
	ldrh r3, [r2]
	ldr r5, _080AF2C4 @ =0x00000222
	adds r0, r4, r5
	strh r3, [r0]
	lsls r1, r1, #6
	ldr r0, _080AF2C8 @ =0x00000342
	adds r1, r1, r0
	adds r1, r1, r4
	ldrh r0, [r2]
	strh r0, [r1]
	bl sub_8001EE4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AF2BC: .4byte 0x020228A8
_080AF2C0: .4byte 0x08AA52DC
_080AF2C4: .4byte 0x00000222
_080AF2C8: .4byte 0x00000342

