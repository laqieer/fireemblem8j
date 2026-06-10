	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_8006038, 0x08006038 + 1
	.section .text.sub_80062C8, "ax", %progbits
@ sub_80062C8 @ JP 0x080062C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80062C8
	.thumb_func
sub_80062C8:
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #2
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #0xa
	bhi _08006324
	lsls r0, r0, #2
	ldr r1, _080062E0 @ =_080062E4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080062E0: .4byte _080062E4
_080062E4: @ jump table
	.4byte _08006314 @ case 0
	.4byte _08006314 @ case 1
	.4byte _08006314 @ case 2
	.4byte _08006310 @ case 3
	.4byte _08006310 @ case 4
	.4byte _08006310 @ case 5
	.4byte _08006314 @ case 6
	.4byte _08006314 @ case 7
	.4byte _08006314 @ case 8
	.4byte _08006324 @ case 9
	.4byte _08006318 @ case 10
_08006310:
	movs r5, #0
	b _08006324
_08006314:
	movs r5, #1
	b _08006324
_08006318:
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	movs r0, #0
	strh r0, [r4, #0x32]
_08006324:
	adds r1, r5, #0
	adds r1, #0x80
	adds r0, r4, #0
	bl sub_8006038
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

