	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.section .text.sub_8067914, "ax", %progbits
@ sub_8067914 @ JP 0x08067914 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8067914
	.thumb_func
sub_8067914:
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _08067960 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08067964 @ =0x08601C80
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	ldr r3, _08067968 @ =0x087A2554
	str r3, [sp]
	adds r0, r4, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	str r0, [r5, #0x60]
	ldrh r1, [r4, #2]
	strh r1, [r0, #2]
	ldrh r1, [r4, #4]
	strh r1, [r0, #4]
	ldr r0, _0806796C @ =0x087A1D3C
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	ldr r0, _08067970 @ =0x087A22E8
	movs r1, #0x20
	bl sub_805679C
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08067960: .4byte 0x0201774C
_08067964: .4byte 0x08601C80
_08067968: .4byte 0x087A2554
_0806796C: .4byte 0x087A1D3C
_08067970: .4byte 0x087A22E8

