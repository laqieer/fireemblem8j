	.syntax unified
	.section .text.sub_80A6C20, "ax", %progbits
@ sub_80A6C20 @ JP 0x080A6C20 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A6C20
	.thumb_func
sub_80A6C20:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	movs r2, #0
	movs r1, #0
	cmp r2, r3
	bge _080A6C46
_080A6C2E:
	adds r0, r4, r1
	ldrb r0, [r0]
	adds r5, r0, #0
	muls r5, r0, r5
	adds r0, r5, #0
	adds r1, #1
	muls r0, r1, r0
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r1, r3
	blt _080A6C2E
_080A6C46:
	lsrs r0, r2, #8
	adds r0, r2, r0
	asrs r1, r2, #0x10
	adds r0, r0, r1
	ldr r2, _080A6C5C @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A6C5C: .4byte 0x000003FF

