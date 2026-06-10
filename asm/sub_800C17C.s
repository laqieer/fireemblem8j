	.syntax unified
	.set sub_80C5628, 0x080C5628 + 1
	.section .text.sub_800C17C, "ax", %progbits
@ sub_800C17C @ JP 0x0800C17C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800C17C
	.thumb_func
sub_800C17C:
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, [r0, #0x38]
	ldr r0, [r0, #4]
	ldr r4, _0800C1BC @ =0x03005270
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r1, [r0, #0x11]
	lsls r1, r1, #5
	ldr r0, _0800C1C0 @ =0x081F5D7C
	adds r1, r1, r0
	movs r2, #0x18
	ldrsh r0, [r1, r2]
	movs r2, #0x1a
	ldrsh r1, [r1, r2]
	mov r5, sp
	adds r5, #2
	mov r2, sp
	adds r3, r5, #0
	bl sub_80C5628
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4, #2]
	ldrh r0, [r5]
	strh r0, [r4, #4]
	movs r0, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800C1BC: .4byte 0x03005270
_0800C1C0: .4byte 0x081F5D7C

