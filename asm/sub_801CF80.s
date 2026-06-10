	.syntax unified
	.set sub_8015E18, 0x08015E18 + 1
	.section .text.sub_801CF80, "ax", %progbits
@ sub_801CF80 @ JP 0x0801CF80 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801CF80
	.thumb_func
sub_801CF80:
	push {lr}
	ldr r1, _0801CFA4 @ =0x03004DF0
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl sub_8015E18
	lsls r0, r0, #0x18
	movs r1, #0
	cmp r0, #0
	bne _0801CF9E
	movs r1, #1
_0801CF9E:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_0801CFA4: .4byte 0x03004DF0

