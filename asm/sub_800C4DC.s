	.syntax unified
	.set sub_80C48D0, 0x080C48D0 + 1
	.section .text.sub_800C4DC, "ax", %progbits
@ sub_800C4DC @ JP 0x0800C4DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800C4DC
	.thumb_func
sub_800C4DC:
	push {lr}
	ldr r1, [r0, #0x38]
	ldr r2, [r1, #4]
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800C504
	ldr r0, _0800C500 @ =0x03005270
	lsls r1, r2, #2
	adds r1, r1, r0
	adds r1, #0x30
	ldrb r2, [r1]
	movs r0, #1
	orrs r0, r2
	strb r0, [r1]
	b _0800C520
	.align 2, 0
_0800C500: .4byte 0x03005270
_0800C504:
	ldr r1, _0800C528 @ =0x03005270
	lsls r0, r2, #2
	adds r0, r0, r1
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0800C520
	adds r0, r2, #0
	movs r1, #0
	movs r2, #0
	bl sub_80C48D0
_0800C520:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0800C528: .4byte 0x03005270

