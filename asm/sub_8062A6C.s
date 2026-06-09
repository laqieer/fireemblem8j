	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.section .text.sub_8062A6C, "ax", %progbits
@ sub_8062A6C @ JP 0x08062A6C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8062A6C
	.thumb_func
sub_8062A6C:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08062AB8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08062ABC @ =0x08600C0C
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x33
	strh r0, [r4, #0x2e]
	ldr r3, _08062AC0 @ =0x086A1CEC
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	str r0, [r4, #0x60]
	ldr r0, _08062AC4 @ =0x0869D100
	movs r1, #0x20
	bl sub_805679C
	ldr r0, _08062AC8 @ =0x0869CEAC
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08062AB8: .4byte 0x0201774C
_08062ABC: .4byte 0x08600C0C
_08062AC0: .4byte 0x086A1CEC
_08062AC4: .4byte 0x0869D100
_08062AC8: .4byte 0x0869CEAC

