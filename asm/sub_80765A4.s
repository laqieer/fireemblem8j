	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8073E74, 0x08073E74 + 1
	.set sub_8073F94, 0x08073F94 + 1
	.set sub_8075E30, 0x08075E30 + 1
	.set sub_80769BC, 0x080769BC + 1
	.set sub_8077190, 0x08077190 + 1
	.section .text.sub_80765A4, "ax", %progbits
@ sub_80765A4 @ JP 0x080765A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80765A4
	.thumb_func
sub_80765A4:
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	bne _080765FC
	strh r0, [r5, #0x2c]
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0xa0
	movs r1, #1
	movs r2, #0x84
	movs r3, #0x3c
	bl sub_8077190
	ldr r1, _080765F0 @ =0x02020110
	ldr r0, _080765F4 @ =0x02020112
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r5, #0
	bl sub_8075E30
	ldr r4, _080765F8 @ =0x000002CD
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl sub_8073E74
	adds r0, r4, #0
	movs r1, #0x38
	movs r2, #0
	bl sub_8073F94
	adds r0, r5, #0
	bl sub_8002DE4
	b _08076616
	.align 2, 0
_080765F0: .4byte 0x02020110
_080765F4: .4byte 0x02020112
_080765F8: .4byte 0x000002CD
_080765FC:
	ldr r4, _08076620 @ =0x020200D8
	ldr r0, [r4]
	bl Proc_End
	bl sub_80769BC
	str r0, [r4]
	movs r0, #0
	strh r0, [r5, #0x2c]
	strh r0, [r5, #0x2e]
	adds r0, r5, #0
	bl sub_8002DE4
_08076616:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08076620: .4byte 0x020200D8

