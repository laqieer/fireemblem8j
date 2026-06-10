	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_8006038, 0x08006038 + 1
	.section .text.sub_80061BC, "ax", %progbits
@ sub_80061BC @ JP 0x080061BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80061BC
	.thumb_func
sub_80061BC:
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #2
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #0xa
	bhi _08006214
	lsls r0, r0, #2
	ldr r1, _080061D4 @ =_080061D8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080061D4: .4byte _080061D8
_080061D8: @ jump table
	.4byte _08006208 @ case 0
	.4byte _08006208 @ case 1
	.4byte _08006208 @ case 2
	.4byte _08006204 @ case 3
	.4byte _08006204 @ case 4
	.4byte _08006204 @ case 5
	.4byte _08006208 @ case 6
	.4byte _08006208 @ case 7
	.4byte _08006208 @ case 8
	.4byte _08006214 @ case 9
	.4byte _0800620C @ case 10
_08006204:
	movs r5, #0
	b _08006214
_08006208:
	movs r5, #1
	b _08006214
_0800620C:
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_08006214:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8006038
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0

