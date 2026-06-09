	.syntax unified
	.set sub_80D65C4, 0x080D65C4 + 1
	.section .text.sub_805055C, "ax", %progbits
@ sub_805055C @ JP 0x0805055C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805055C
	.thumb_func
sub_805055C:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	ldr r2, _08050568 @ =0x03001868
	b _0805058E
	.align 2, 0
_08050568: .4byte 0x03001868
_0805056C:
	cmp r1, #2
	bne _0805058C
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r0, [r3, #0x30]
	ldrb r0, [r0, #9]
	cmp r1, r0
	bne _0805058C
	ldr r2, [r2, #4]
	adds r0, r4, #0
	adds r1, r3, #0
	bl sub_80D65C4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0805059A
_0805058C:
	adds r2, #8
_0805058E:
	ldrh r1, [r2, #2]
	movs r5, #2
	ldrsh r0, [r2, r5]
	cmp r0, #0
	bne _0805056C
	movs r0, #0xff
_0805059A:
	pop {r4, r5}
	pop {r1}
	bx r1

