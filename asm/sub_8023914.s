	.syntax unified
	.set sub_80165F0, 0x080165F0 + 1
	.set sub_8037A24, 0x08037A24 + 1
	.section .text.sub_8023914, "ax", %progbits
@ sub_8023914 @ JP 0x08023914 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8023914
	.thumb_func
sub_8023914:
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	movs r5, #0
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #1
	bne _08023926
	movs r5, #1
_08023926:
	ldr r0, _0802395C @ =0x03004DF0
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_8037A24
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x34
	movs r2, #0x2c
	ldrsh r3, [r4, r2]
	lsls r3, r3, #5
	movs r6, #0x2a
	ldrsh r2, [r4, r6]
	adds r3, r3, r2
	lsls r3, r3, #1
	ldr r2, _08023960 @ =0x02022CA8
	adds r3, r3, r2
	adds r2, r5, #0
	bl sub_80165F0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0802395C: .4byte 0x03004DF0
_08023960: .4byte 0x02022CA8

