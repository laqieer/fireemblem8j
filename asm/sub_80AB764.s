	.syntax unified
	.set __udivsi3, 0x080D67D0 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.section .text.sub_80AB764, "ax", %progbits
@ sub_80AB764 @ JP 0x080AB764 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AB764
	.thumb_func
sub_80AB764:
	push {r4, r5, lr}
	bl sub_8000CD8
	ldr r5, _080AB7AC @ =0x0202BCEC
	ldr r1, [r5, #4]
	subs r0, r0, r1
	movs r1, #0xb4
	bl __udivsi3
	adds r4, r0, #0
	ldr r0, _080AB7B0 @ =0x0000EA60
	cmp r4, r0
	ble _080AB780
	adds r4, r0, #0
_080AB780:
	ldr r0, _080AB7B4 @ =0x0203EF5C
	movs r1, #0x7f
	ldrb r2, [r5, #0xe]
	ands r2, r1
	ldrb r3, [r0]
	movs r1, #0x80
	rsbs r1, r1, #0
	ands r1, r3
	orrs r1, r2
	strb r1, [r0]
	ldrh r2, [r5, #0x10]
	lsls r2, r2, #7
	ldrh r3, [r0]
	movs r1, #0x7f
	ands r1, r3
	orrs r1, r2
	strh r1, [r0]
	strh r4, [r0, #2]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080AB7AC: .4byte 0x0202BCEC
_080AB7B0: .4byte 0x0000EA60
_080AB7B4: .4byte 0x0203EF5C

